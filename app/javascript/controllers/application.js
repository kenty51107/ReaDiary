import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

import * as Vue from "vue";

const modal = Vue.createApp({});

const { createApp, ref } = Vue;

modal.component("modal-window", {
  template: `
			<div class="grid-item">
				<div class="img" @click="modalWindow = true"><slot name="modal-img"></slot></div>
				<div class="text" @click="modalWindow = true">
					<h5><slot name="modal-title"></slot></h5>
				</div>
				<transition name="fade">
					<div class="overlay" v-show="modalWindow" @click="modalWindow = false">
						<div class="modal-container" v-on:click="stopEvent">
							<header class="modal-header">情報を登録して読書を開始しよう！</header>
							<div class="modal-content">
								<div class="modal-content-left">
									<slot name="modal-img"></slot>
								</div>
								<div class="modal-content-right">
									<slot name="form"></slot>
								</div>
							</div>
						</div>
					</div>
				</transition>
			</div>
	`,
  data() {
    return {
      modalWindow: false,
    };
  },
  methods: {
    stopEvent(envet) {
      event.stopPropagation();
    },
  },
});
modal.mount("#modal");
