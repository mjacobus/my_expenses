import React from "react";
import LoggedInLayout from "../pages/layouts/LoggedInLayout";

export default function withLayout(element: any) {
  return <LoggedInLayout>{element}</LoggedInLayout>;
}
