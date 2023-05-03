import React, { useState, useEffect, useContext } from "react";
import Navigation, { Page } from "./Navigation";
import { Context as UserContext } from "../contexts/userContext";

const pages: Page[] = [
  {
    text: "Minhas despesas",
    href: "/despesas",
  },
];

function UserNavigation() {
  const context = useContext(UserContext);

  if (!context.userData) {
    return <React.Fragment />;
  }

  return <Navigation userData={context.userData} pages={pages} />;
}

export default UserNavigation;
