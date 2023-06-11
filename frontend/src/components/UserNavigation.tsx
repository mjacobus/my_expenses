import React from "react";
import Navigation from "./Navigation";
import UserData from "../types/UserData";

function UserNavigation({
  userData,
  children,
}: {
  userData: UserData;
  children: any;
}) {
  return <Navigation userData={userData} children={children} />;
}

export default UserNavigation;
