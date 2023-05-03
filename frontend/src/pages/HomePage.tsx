import React, { useContext } from "react";
import { Context as UserContext } from "../contexts/userContext";
import Alert from "@mui/material/Alert";
import { Link } from "react-router-dom";

export default function HomePage() {
  const context = useContext(UserContext);

  return (
    <Alert>
      Hello {context.userData?.name}. Welcome again. Check your{" "}
      <Link to="/profile">profile</Link>
    </Alert>
  );
}
