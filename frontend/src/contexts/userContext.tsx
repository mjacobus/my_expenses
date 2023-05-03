import React from "react";
import { useEffect, useState, createContext } from "react";
import api from "../utils/api";
import UserData from "../types/UserData";

const DEFAULT_CONTEXT: { userData: UserData | null } = { userData: null };
const Context = createContext(DEFAULT_CONTEXT);

const Provider = function ({ children }: { children: any }) {
  const [userData, setUserData] = useState<UserData | null>(null);

  async function fetchData() {
    const data = await api.fetchUserSession();

    if (!data && window.location.pathname != "/login") {
      return (window.location.href = "/login");
    }

    setUserData(data);
  }

  useEffect(() => {
    fetchData();
  }, []);

  const value = { userData };

  return <Context.Provider value={value}>{children}</Context.Provider>;
};

export { Provider, Context };
