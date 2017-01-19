//= require ./approvals/approvals_store

(() => {
  let singleton;

  class MergeRequestWidgetStore {
    constructor(rootEl) {
      if (!singleton) {
        singleton = gl.MergeRequestWidget.Store = this;
        this.init(rootEl);
      }
      return singleton;
    }

    init(rootEl) {
      this.rootEl = rootEl;
      this.data = {};

      // init other widget stores here
      this.initWidgetState();
      this.initApprovals();
    }

    initWidgetState() {
      this.assignToData('showApprovals', false);
      this.assignToData('disableAcceptance', Boolean(this.rootEl.dataset.approvalPending));
    }

    initApprovals() {
      gl.ApprovalsStore = new gl.MergeRequestApprovalsStore(this);
      this.assignToData('approvals', {});
    }

    assignToData(key, val) {
      this.data[key] = val;
      return val;
    }
  }
  gl.MergeRequestWidgetStore = MergeRequestWidgetStore;
})(window.gl || (window.gl = {}));