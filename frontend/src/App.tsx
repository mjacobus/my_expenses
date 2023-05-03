import React from "react";
import LoginPage from "./pages/LoginPage";
import HomePage from "./pages/HomePage";
import ProfilePage from "./pages/ProfilePage";
import withLayout from "./utils/withLayout";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { Provider as UserContextProvider } from "./contexts/userContext";

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
  {
    path: "/profile",
    element: withLayout(<ProfilePage />),
  },
]);

function Router() {
  return (
    <React.StrictMode>
      <UserContextProvider>
        <RouterProvider router={router} />
      </UserContextProvider>
    </React.StrictMode>
  );
}
export default Router;
