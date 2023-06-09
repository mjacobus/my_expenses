import React, { useContext } from "react";
import UserNavigation from "../../components/UserNavigation";
import { Context as UserContext } from "../../contexts/userContext";
import Container from "@mui/material/Container";

export default function LoggedInLayout({ children }: { children: any }) {
  const context = useContext(UserContext);

  if (!context.userData) {
    return <></>;
  }

  return (
    <>
      <UserNavigation userData={context.userData}>
        <Container>{children}</Container>
      </UserNavigation>
    </>
  );
}
