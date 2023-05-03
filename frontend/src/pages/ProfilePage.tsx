import React, { useContext } from "react";
import { Context as UserContext } from "../contexts/userContext";
import Alert from "@mui/material/Alert";
import { Link } from "react-router-dom";

export default function ProfilePage() {
  const { userData } = useContext(UserContext);

  return (
    <>
      <Alert>
        Do you like your pic? If not, go <Link to="/">Home</Link>
      </Alert>
      <img src={userData?.avatar} alt={userData?.name} />
    </>
  );
}
