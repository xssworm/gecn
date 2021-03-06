/**
 * Render environments table.
 *
 * Dumb component used to render top level environments and
 * the folder view.
 */
import EnvironmentTableRowComponent from './environment_item';
import DeployBoard from './deploy_board_component';

export default {
  components: {
    'environment-item': EnvironmentTableRowComponent,
    DeployBoard,
  },

  props: {
    environments: {
      type: Array,
      required: true,
      default: () => ([]),
    },

    canReadEnvironment: {
      type: Boolean,
      required: false,
      default: false,
    },

    canCreateDeployment: {
      type: Boolean,
      required: false,
      default: false,
    },

    toggleDeployBoard: {
      type: Function,
      required: false,
      default: () => {},
    },

    store: {
      type: Object,
      required: false,
      default: () => ({}),
    },

    service: {
      type: Object,
      required: true,
      default: () => ({}),
    },

    isLoadingFolderContent: {
      type: Boolean,
      required: false,
      default: false,
    },
  },

  methods: {
    folderUrl(model) {
      return `${window.location.pathname}/folders/${model.folderName}`;
    },
  },

  template: `
    <table class="table ci-table">
      <thead>
        <tr>
          <th class="environments-name">Environment</th>
          <th class="environments-deploy">Last deployment</th>
          <th class="environments-build">Job</th>
          <th class="environments-commit">Commit</th>
          <th class="environments-date">Updated</th>
          <th class="environments-actions"></th>
        </tr>
      </thead>
      <tbody>
        <template v-for="model in environments"
          v-bind:model="model">

          <tr is="environment-item"
            :model="model"
            :can-create-deployment="canCreateDeployment"
            :can-read-environment="canReadEnvironment"
            :toggleDeployBoard="toggleDeployBoard"
            :service="service"></tr>

          <tr v-if="model.hasDeployBoard && model.isDeployBoardVisible" class="js-deploy-board-row">
            <td colspan="6" class="deploy-board-container">
              <deploy-board
                :store="store"
                :service="service"
                :environmentID="model.id"
                :deployBoardData="model.deployBoardData"
                :endpoint="model.rollout_status_path">
              </deploy-board>
            </td>
          </tr>

          <template v-if="model.isFolder && model.isOpen && model.children && model.children.length > 0">
            <tr v-if="isLoadingFolderContent">
              <td colspan="6" class="text-center">
                <i class="fa fa-spin fa-spinner fa-2x" aria-hidden="true"/>
              </td>
            </tr>

            <template v-else>
              <tr is="environment-item"
                v-for="children in model.children"
                :model="children"
                :can-create-deployment="canCreateDeployment"
                :can-read-environment="canReadEnvironment"
                :service="service"></tr>

              <tr>
                <td colspan="6" class="text-center">
                  <a :href="folderUrl(model)" class="btn btn-default">
                    Show all
                  </a>
                </td>
              </tr>
            </template>
          </template>
        </template>
      </tbody>
    </table>
  `,
};
