import React from "react";
import Navigation, { Page, UserData } from "./Navigation";

function UserNavigation() {
  const userData: UserData = {
    name: "Marcelo Jacobus",
    email: "marcelojacobus@gmail.com",
    avatar:
      "https://lh3.googleusercontent.com/a/AGNmyxZveEOuHtU-N9UL75chANiTx6tPFTRXEQni_PzgVw=s96-c",
  };

  const pages: Page[] = [
    {
      text: "Minhas despesas",
      href: "/despesas",
    },
  ];

  return <Navigation userData={userData} pages={pages} />;
}

export default UserNavigation;
