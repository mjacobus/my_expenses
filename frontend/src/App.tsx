import React from "react";
import Alert from "@mui/material/Alert";
import Navigation from "./components/UserNavigation";

import "./app.css";

const App = function () {
  return (
    <React.Fragment>
      <Navigation />
      <Alert severity="success">Hello World!</Alert>;
    </React.Fragment>
  );
};

export default App;
