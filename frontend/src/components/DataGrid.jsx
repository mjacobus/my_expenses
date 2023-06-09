import React, { useState, useEffect } from "react";
import Table from "@mui/material/Table";
import TableHead from "@mui/material/TableHead";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableRow from "@mui/material/TableRow";

function createTableRowProps(config) {
  const props = {};
  props.key = config.key;
  props.cells = config.values;
  return props;
}

function createTableCellProps(config, key) {
  return { key: key, children: config };
}

function createTableCell(config, key) {
  const props = createTableCellProps(config, key);
  return <TableCell key={key} {...props} />;
}

function createTableRow(config) {
  const props = createTableRowProps(config);
  return (
    <TableRow key={props.key}>
      {props.cells.map((cellConfig, key) => createTableCell(cellConfig, key))}
    </TableRow>
  );
}

function tableHead(rows) {
  if (rows && rows.length > 0) {
    return (
      <TableHead>{rows.map((config) => createTableRow(config))}</TableHead>
    );
  }
}

function tableBody(rows) {
  if (rows && rows.length > 0) {
    return (
      <TableBody>{rows.map((config) => createTableRow(config))}</TableBody>
    );
  }
}

export default function DataGrid({ rows, headers }) {
  return (
    <Table>
      {tableHead(headers)}
      {tableBody(rows)}
    </Table>
  );
}
