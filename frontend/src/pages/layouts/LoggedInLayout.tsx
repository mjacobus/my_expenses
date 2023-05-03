import React from "react";
import Navigation from "../../components/UserNavigation";

export default function LoggedInLayout({ children }: { children: any }) {
  return (
    <>
      <Navigation />
      {children}
    </>
  );
}
