import React from "react";
import { LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";
import Label from "@mui/material/InputLabel";

// https://mui.com/x/react-data-grid/getting-started/
export default function ListFilter() {
  return (
    <LocalizationProvider dateAdapter={AdapterDayjs}>
      <Label>Expensed at:</Label>
      <DatePicker label="From" />
      <DatePicker label="To" />
    </LocalizationProvider>
  );
}
