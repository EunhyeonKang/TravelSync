(function ($) {
	// var common
	var $win = $(window);
	var $doc = $(document);

	// scrollBlock
	var scrollBlock = {
		scrollTop: 0,
		className: {
			block: 'is-scroll-blocking'
		},
		block: function () {
			var _ = scrollBlock;
			var $html = $('html');
			var $wrap = $('.wrap');

			scrollBlock.scrollTop = $win.scrollTop();

			if (!$html.hasClass(_.className.block)) {
				$html.addClass(_.className.block);
			}

			$win.scrollTop(0);
			$wrap.scrollTop(_.scrollTop);
		},
		clear: function () {
			var _ = scrollBlock;
			var $html = $('html');
			var $wrap = $('.wrap');

			if ($html.hasClass(_.className.block)) {
				$html.removeClass(_.className.block);
			}

			$wrap.scrollTop(0);
			$win.scrollTop(_.scrollTop);
		}
	};
	window.uiJSScrollBlock = scrollBlock;

	// layer
	var uiLayer = {
		zIndex: 10000,
		open: function (target, opener, speed) {
			var _ = uiLayer;
			var $html = $('html');
			var $layer = $('[data-layer="' + target + '"]');
			var timer = null;
			var isScrollBlock = true;
			var isFocus = true;
			var speed = typeof speed === 'number' ? speed : 250;

			if ($layer.length && !$layer.hasClass('js-layer-opened')) {
				isScrollBlock = (function () {
					var val = $layer.data('scroll-block');
					if (typeof val === 'boolean' && !val) {
						return false;
					} else {
						return isScrollBlock;
					}
				})();
				isFocus = (function () {
					var val = $layer.data('focus');
					if (typeof val === 'boolean' && !val) {
						return false;
					} else {
						return isFocus;
					}
				})();

				_.zIndex++;
				$layer.trigger('layerBeforeOpened');
				$html.addClass('js-html-layer-opened js-html-layer-opened-' + target);
				$layer
					.stop()
					.removeClass('js-layer-closed')
					.css({
						display: 'block',
						zIndex: _.zIndex
					})
					.animate(
						{
							opacity: 1
						},
						speed,
						function () {
							$layer.trigger('layerAfterOpened');
						}
					)
					.attr('tabindex', '0')
					.data('layerIndex', $('.js-layer-opened').length);

				if (isFocus) {
					$layer.focus();
				}

				if (isScrollBlock) {
					scrollBlock.block();
				}

				if (Boolean(opener) && $(opener).length) {
					$layer.data('layerOpener', $(opener));
				}

				timer = setTimeout(function () {
					clearTimeout(timer);
					$layer.addClass('js-layer-opened').trigger('layerOpened');
				}, 0);
			}
		},
		close: function (target, speed) {
			var $html = $('html');
			var $layer = $('[data-layer="' + target + '"]');
			var timer = null;
			var speed = typeof speed === 'number' ? speed : 250;

			if ($layer.length && $layer.hasClass('js-layer-opened')) {
				$layer
					.trigger('layerBeforeClosed')
					.stop()
					.removeClass('js-layer-opened')
					.addClass('js-layer-closed')
					.css('display', 'block')
					.data('layerIndex', null)
					.animate(
						{
							opacity: 0
						},
						speed,
						function () {
							var $opener = $layer.data('layerOpener');
							var $openedLayer = $('.js-layer-opened');
							var $openedLayerIsScrollBlock = $openedLayer.not(function () {
								var val = $(this).data('scroll-block');
								if (typeof val === 'boolean' && !val) {
									return true;
								} else {
									return false;
								}
							});
							var isScrollBlock = $html.hasClass(scrollBlock.className.block);

							$(this)
								.css('display', 'none')
								.removeClass('js-layer-closed');

							$html.removeClass('js-html-layer-closed-animate js-html-layer-opened-' + target);

							if (!$openedLayer.length) {
								$html.removeClass('js-html-layer-opened');
							}

							if (!$openedLayerIsScrollBlock.length && isScrollBlock) {
								scrollBlock.clear();
							}

							if ($opener && $opener.length) {
								$opener.focus();
								$layer.data('layerOpener', null);
							}

							$layer.trigger('layerAfterClosed');
						}
					)
					.trigger('layerClosed');

				timer = setTimeout(function () {
					clearTimeout(timer);
					$html.addClass('js-html-layer-closed-animate');
				}, 0);
			}
		},
		checkFocus: function (e) {
			var $layer = $('[data-layer]')
				.not(':hidden')
				.not(function () {
					var val = $(this).data('scroll-block');
					if (typeof val === 'boolean' && !val) {
						return true;
					} else {
						return false;
					}
				});
			var $target = $(e.target);
			var $closest = $target.closest('[data-layer]');
			var lastIndex = (function () {
				var index = 0;
				$layer.each(function () {
					var crrI = $(this).data('layerIndex');
					if (crrI > index) {
						index = crrI;
					}
				});
				return index;
			})();
			var checkLayer = $layer.length && !($target.is($layer) && $target.data('layerIndex') === lastIndex) && !($closest.length && $closest.is($layer) && $closest.data('layerIndex') === lastIndex);

			if (checkLayer) {
				$layer
					.filter(function () {
						return $(this).data('layerIndex') === lastIndex;
					})
					.focus();
			}
		}
	};
	window.uiJSLayer = uiLayer;

	$doc
		.on('focusin.uiLayer', uiLayer.checkFocus)
		.on('click.uiLayer', '[data-role="layerClose"]', function () {
			var $this = $(this);
			var $layer = $this.closest('[data-layer]');
			if ($layer.length) {
				uiLayer.close($layer.attr('data-layer'));
			}
		})
		.on('click.uiLayer', '[data-layer-open]', function (e) {
			var $this = $(this);
			var layer = $this.attr('data-layer-open');
			var $layer = $('[data-layer="' + layer + '"]');
			if ($layer.length) {
				uiLayer.open(layer);
				$layer.data('layerOpener', $this);
			}
			e.preventDefault();
		})
		.on('layerAfterOpened.uiLayer', '[data-layer-timer-close]', function () {
			var $this = $(this);
			var layer = $this.attr('data-layer');
			var delay = Number($this.attr('data-layer-timer-close'));
			var timer = setTimeout(function () {
				uiLayer.close(layer);
				clearTimeout(timer);
			}, delay);
			$this.data('layer-timer', timer);
		})
		.on('layerBeforeClosed.uiLayer', '[data-layer-timer-close]', function () {
			var $this = $(this);
			var timer = $this.data('layer-timer');
			clearTimeout(timer);
		});

	// popup
	$doc
		.on('click', '[data-popup-target]', function () {
			var target = $(this).data('popup-target');
			var popW = $(this).data('popup-width');
			var popH = $(this).data('popup-height');
			var leftPosition = (screen.width - popW) / 2;
			var topPosition = (screen.height - popH) / 2;
			window.open(target + '.html', '_blank', 'left=' + leftPosition + ', top=' + topPosition + ', width=' + popW + ', height=' + popH + ', scrollbars=no,resizable=no');
		})
		.on('click', '[data-role="popupClose"]', function () {
			window.close();
		});

	// select
	function selectUpdate($select) {
		var $wrap = $select.parent();
		var val = $select.get(0).value;
		var className = 'is-selected';
		var isClass = $wrap.hasClass(className);

		if (val === '-1' && isClass) {
			$wrap.removeClass(className);
		} else if (val !== '-1' && !isClass) {
			$wrap.addClass(className);
		}
		if ($select.is(':disabled')) {
			$wrap.addClass('is-disabled');
		}
	}
	function selectInit() {
		$('.item-select select').each(function () {
			var $this = $(this);
			selectUpdate($this);
		});
	}
	$doc
		.on('change.uiSelect', '.item-select select', function () {
			var $this = $(this);
			selectUpdate($this);
		})
		.on('focus.uiSelect', '.item-select select', function () {
			var $this = $(this);
			var $wrap = $this.parent();
			$wrap.addClass('is-focus');
		})
		.on('blur.uiSelect', '.item-select select', function () {
			var $this = $(this);
			var $wrap = $this.parent();
			$wrap.removeClass('is-focus');
		});

	// input
	function inputUpdate($input) {
		var $wrap = $input.parent();

		if ($input.is(':disabled')) {
			$wrap.addClass('is-disabled');
		}
		if ($input.is('[readonly]')) {
			$wrap.addClass('is-readonly');
		}
	}
	function inputInit() {
		$('.item-input input').each(function () {
			var $this = $(this);
			inputUpdate($this);
		});
	}
	$doc
		.on('focus.uiInput', '.item-input input', function () {
			var $this = $(this);
			var $wrap = $this.parent();
			$wrap.addClass('is-focus');
		})
		.on('blur.uiInput', '.item-input input', function () {
			var $this = $(this);
			var $wrap = $this.parent();
			$wrap.removeClass('is-focus');
		});

	// file
	function fileInit() {
		$('.item-file').each(function () {
			var $this = $(this);
			var $input = $this.find('input[type="file"]');
			var $fileInput = $this.find('.item-file-input');
			var $fileName = $this.find('.item-file-name');
			var placeholder = $input.attr('placeholder');
			if ($input.attr('value')) {
				$fileInput.addClass('has-value');
				$fileName.text($input.attr('value'));
			} else {
				$fileInput.removeClass('has-value');
				$fileName.text(placeholder);
			}
			$input.on('change', function () {
				console.log($input.val());
				if ($input.val()) {
					$fileInput.addClass('has-value');
					$fileName.text($input.val());
				}
			});
		});
	}
	$doc
		.on('click.uiFile', '.item-file-delete', function () {
			var $this = $(this);
			var $wrap = $this.closest('.item-file');
			var $fileName = $this.siblings('.item-file-name');
			var $input = $wrap.find('input');
			$input.val('').attr('value', '');
			$fileName.text('');
			fileInit();
		});

	// datepicker
	function datepickerInit() {
		$('.item-input-date input').datepicker({
			showMonthAfterYear: true,
			monthNames: ['.01', '.02', '.03', '.04', '.05', '.06', '.07', '.08', '.09', '.10', '.11', '.12'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			dateFormat: 'yy.mm.dd'
		});
	}

	// tab
	function tabInit() {
		var $dataTab = $('[data-tab]');
		var tabOnContents = [];
		$dataTab.each(function () {
			if ($(this).parent().is('.is-active')) {
				tabOnContents.push($(this).data('tab'));
			}
		});
		$.each(tabOnContents, function (key, value) {
			var $content = $('[data-tab-content=' + value + ']');
			$content.addClass('is-active');
		});
		$dataTab.on('click', function () {
			var tabGroup = [];
			var data = $(this).data('tab');
			$(this).closest('.tab-menu').find('[data-tab]').each(function () {
				if ($.inArray($(this).data('tab'), tabGroup) == -1) {
					tabGroup.push($(this).data('tab'));
				}
				$(this).parent().removeClass('is-active');
			});
			$.each(tabGroup, function (key, value) {
				var $content = $('[data-tab-content=' + value + ']');
				$content.removeClass('is-active');
			});
			var $content = $('[data-tab-content=' + data + ']');
			$content.addClass('is-active');
			$(this).parent().addClass('is-active');
		});
	}

	// accordion
	function accordionInit() {
		var $dataAccordion = $('[data-accordion]');
		$dataAccordion.each(function () {
			var $this = $(this);
			var data = $this.data('accordion');
			var open = $this.data('initial-open');
			var $content = $('[data-accordion-content=' + data + ']');
			if (open) {
				$this.addClass('is-active');
				$content.addClass('is-active').css('height', 'auto');
			}
			$this.on('click', function () {
				if ($content.height() == 0) {
					$content.css('height', 'auto');
					var contentH = $content.height();
					$this.addClass('is-active');
					$content.addClass('is-active').css('height', '0').animate({
						'height': contentH + 'px'
					}, 300);
				} else {
					$this.removeClass('is-active');
					$content.removeClass('is-active').animate({
						'height': '0'
					}, 200);
				}
			});
		});
	}

	// scroll
	function scrollYInit() {
		$('.scroll-y, .tree-box-aside .tree-box, .layer-wrap .ui-layer__body-inner-1, .category-type-list-body').each(function () {
			var $this = $(this);
			$this.mCustomScrollbar({
				scrollInertia: 200,
				callbacks: {
					onOverflowY: function () {
						if ($(this).is('.ui-layer__body-inner-1')) {
							$scrollbar = $(this).find('.mCSB_scrollTools');
							$(this).append($scrollbar);
						}
					}
				}
			});
		});
	}
	function scrollXInit($target) {
		$target.each(function () {
			var $this = $(this);
			$this.mCustomScrollbar({
				axis: "x",
				scrollInertia: 200
			});
		});
	}
	function scrollUpdate($target) {
		$target.mCustomScrollbar('update');
	}

	// table scroll
	function tableScrollX() {
		$('.table-list').each(function () {
			var $this = $(this);
			var $table = $(this).find('table').eq(0);
			if (Math.ceil($this.width()) < $table.width()) {
				$this.wrap('<div class="table-list-scroll"></div>');
				$this.width($table.width());
				scrollXInit($this.parent());
			} else {
				$this.width('');
			}
		})
	}

	// button on/off
	function buttonToggle() {
		$('[data-button-toggle="button"]').on('click', function () {
			var $this = $(this);
			var $wrap = $this.closest('[data-button-toggle="wrapper"]');
			$wrap.find('[data-button-toggle="button"]').parent().removeClass('is-active');
			$this.parent().addClass('is-active');
		})
	}

	$('.table-click-select tbody tr').on('click', function () {
		var $this = $(this);
		$this.addClass('is-selected').siblings().removeClass('is-selected');
	})

	// dom ready
	$(function () {
		tabInit();
		selectInit();
		inputInit();
		datepickerInit();
		fileInit();
		scrollYInit();
		buttonToggle();
		accordionInit();
		tableScrollX();
	});

	// win load, scroll, resize
	$win
		.on('load', function () {
			//
		})
		.on('scroll', function () {
			//
		})
		.on('resize', function () {
			tableScrollX();
		});
})(jQuery);
