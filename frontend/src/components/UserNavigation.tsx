import React, { useState, useEffect } from "react";
import Navigation, { Page } from "./Navigation";
import api from "../utils/api";
import UserData from "../types/UserData";

const pages: Page[] = [
  {
    text: "Minhas despesas",
    href: "/despesas",
  },
];

function UserNavigation() {
  const [userData, setUserData] = useState<UserData | null>(null);

  async function fetchData() {
    const data = await api.fetchUserSession();

    if (!data) {
      throw new Error("User is not logged in");
    }

    setUserData(data);
  }

  useEffect(() => {
    fetchData();
  }, []);

  if (!userData) {
    return <React.Fragment />;
  }

  return <Navigation userData={userData} pages={pages} />;
}

export default UserNavigation;
