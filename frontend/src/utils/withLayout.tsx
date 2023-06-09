import React from "react";
import LoggedInLayout from "../pages/layouts/LoggedInLayout";

export default function withLayout(element: any) {
  console.log(element);
  return <LoggedInLayout>{element}</LoggedInLayout>;
}
