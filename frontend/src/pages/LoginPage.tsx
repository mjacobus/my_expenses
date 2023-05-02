import React from "react";
import Button from "@mui/material/Button";
import EmailIcon from "@mui/icons-material/Email";

export default function LoginPage() {
  return (
    <Button
      variant="contained"
      startIcon={<EmailIcon />}
      href="/auth/google_oauth2"
    >
      Login with your google account
    </Button>
  );
}
