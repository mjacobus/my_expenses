import React from "react";
import Navigation, { Page } from "./Navigation";
import UserData from "../types/UserData";

const pages: Page[] = [
  {
    text: "Minhas despesas",
    href: "/expenses",
  },
];

function UserNavigation({ userData }: { userData: UserData }) {
  return <Navigation userData={userData} pages={pages} />;
}

export default UserNavigation;
