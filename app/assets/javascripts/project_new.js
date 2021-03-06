/* eslint-disable func-names, space-before-function-paren, no-var, prefer-rest-params, wrap-iife, no-unused-vars, one-var, no-underscore-dangle, prefer-template, no-else-return, prefer-arrow-callback, max-len */

(function() {
  this.ProjectNew = (function() {
    function ProjectNew() {
      this.$selects = $('.features select');
      this.$repoSelects = this.$selects.filter('.js-repo-select');
      this.$enableApprovers = $('.js-require-approvals-toggle');

      $('.project-edit-container').on('ajax:before', (function(_this) {
        return function() {
          $('.project-edit-container').hide();
          return $('.save-project-loader').show();
        };
      })(this));

      this.initVisibilitySelect();

      this.toggleSettings();
      this.bindEvents();
      this.toggleRepoVisibility();
    }

    ProjectNew.prototype.bindEvents = function() {
      this.$selects.on('change', () => this.toggleSettings());
      $('#require_approvals').on('change', e => this.toggleApproverSettingsVisibility(e));
    };

    ProjectNew.prototype.initVisibilitySelect = function() {
      const visibilityContainer = document.querySelector('.js-visibility-select');
      if (!visibilityContainer) return;
      const visibilitySelect = new gl.VisibilitySelect(visibilityContainer);
      visibilitySelect.init();
    };

    ProjectNew.prototype.toggleApproverSettingsVisibility = function(e) {
      this.$requiredApprovals = $('#project_approvals_before_merge');
      const enabled = $(e.target).prop('checked');
      const val = enabled ? 1 : 0;
      this.$requiredApprovals.val(val);
      this.$requiredApprovals.prop('min', val);
      $('.nested-settings').toggleClass('hidden', !enabled);
    };

    ProjectNew.prototype.toggleSettings = function() {
      var self = this;

      this.$selects.each(function () {
        var $select = $(this);
        var className = $select.data('field')
          .replace(/_/g, '-')
          .replace('access-level', 'feature');
        self._showOrHide($select, '.' + className);
      });
    };

    ProjectNew.prototype._showOrHide = function(checkElement, container) {
      var $container = $(container);

      if ($(checkElement).val() !== '0') {
        return $container.show();
      } else {
        return $container.hide();
      }
    };

    ProjectNew.prototype.toggleRepoVisibility = function () {
      var $repoAccessLevel = $('.js-repo-access-level select');
      var containerRegistry = document.querySelectorAll('.js-container-registry')[0];
      var containerRegistryCheckbox = document.getElementById('project_container_registry_enabled');

      this.$repoSelects.find("option[value='" + $repoAccessLevel.val() + "']")
        .nextAll()
        .hide();

      $repoAccessLevel.off('change')
        .on('change', function () {
          var selectedVal = parseInt($repoAccessLevel.val(), 10);

          this.$repoSelects.each(function () {
            var $this = $(this);
            var repoSelectVal = parseInt($this.val(), 10);

            $this.find('option').show();

            if (selectedVal < repoSelectVal) {
              $this.val(selectedVal);
            }

            $this.find("option[value='" + selectedVal + "']").nextAll().hide();
          });

          if (selectedVal) {
            this.$repoSelects.removeClass('disabled');

            if (containerRegistry) {
              containerRegistry.style.display = '';
            }
          } else {
            this.$repoSelects.addClass('disabled');

            if (containerRegistry) {
              containerRegistry.style.display = 'none';
              containerRegistryCheckbox.checked = false;
            }
          }
        }.bind(this));
    };

    return ProjectNew;
  })();
}).call(window);
