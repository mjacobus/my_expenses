import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

function setupApp(element: HTMLElement): void {
  const root = ReactDOM.createRoot(element);

  root.render(
    <React.StrictMode>
      <App></App>
    </React.StrictMode>
  );
}

export { setupApp };
