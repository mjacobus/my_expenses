import { setupApp } from "../../../frontend/src";

document.addEventListener("DOMContentLoaded", () => {
  const rootElement = document.getElementById("app_root");

  if (rootElement) {
    setupApp(rootElement);
  }
});
