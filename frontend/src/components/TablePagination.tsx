import React from "react";
import TablePagination from "@mui/material/TablePagination";

interface TablePaginationProps {
  count: number;
  page: number;
  perPage: number;
  setPage: (page: number) => void;
  setPerPage: (perPage: number) => void;
}

export default function CustomPagination({
  count = 0,
  page = 1,
  perPage = 100,
  setPerPage = () => {},
  setPage = () => {},
}: TablePaginationProps) {
  function onPageChange(
    _event: React.MouseEvent<HTMLButtonElement> | null,
    page: number
  ) {
    setPage(page + 1);
  }

  function onRowsPerPageChange(event: React.ChangeEvent<HTMLInputElement>) {
    setPerPage(parseInt(event.target.value));
  }

  return (
    <TablePagination
      component="div"
      count={count}
      page={page - 1}
      rowsPerPage={perPage}
      onPageChange={onPageChange}
      onRowsPerPageChange={onRowsPerPageChange}
    />
  );
}
