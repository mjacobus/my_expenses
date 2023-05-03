import React from "react";
import LoginPage from "./pages/LoginPage";
import HomePage from "./pages/HomePage";
import withLayout from "./utils/withLayout";
import { createBrowserRouter, RouterProvider } from "react-router-dom";

import "./app.css";

const router = createBrowserRouter([
  {
    path: "/login",
    element: <LoginPage />,
  },
  {
    path: "/",
    element: withLayout(<HomePage />),
  },
]);

function Router() {
  return <RouterProvider router={router} />;
}
export default Router;
