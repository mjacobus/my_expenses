import React from "react";
import Alert from "@mui/material/Alert";
import Navigation from "./components/UserNavigation";
import LoginPage from "./pages/LoginPage";
import { createBrowserRouter, RouterProvider } from "react-router-dom";

import "./app.css";

const App = function () {
  return (
    <React.Fragment>
      <Navigation />
      <Alert severity="success">Hello World!</Alert>
    </React.Fragment>
  );
};

const router = createBrowserRouter([
  {
    path: "/login",
    element: <LoginPage />,
  },
  {
    path: "/",
    element: <App />,
  },
]);

function Router() {
  return <RouterProvider router={router} />;
}
export default Router;
