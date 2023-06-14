import React, { useState, useEffect } from "react";
import Alert from "@mui/material/Alert";
import api from "../../utils/api";
import DataGrid from "../../components/DataGrid";
import Pagination from "../../components/TablePagination";
import Expense from "../../types/Expense";

function Expenses({ expenses }: { expenses: Expense[] }) {
  const rows = expenses.map((expense) => ({
    key: expense.id,
    values: [
      expense.id,
      expense.description,
      expense.amount,
      expense.expensed_at,
    ],
  }));
  const headers = [
    {
      key: "header",
      values: ["ID", "Description", "Amount", "Expensed At"],
    },
  ];
  return <DataGrid rows={rows} headers={headers} />;
}

function Page({ children }: { children: React.ReactNode }) {
  return (
    <>
      <h1>Minhas despesas</h1>
      {children}
    </>
  );
}

export default function IndexPage() {
  const [expenses, setExpenses] = useState<Expense[]>([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(0); // it starts at 0
  const [perPage, setPerPage] = useState(10);
  const [count, setCount] = useState(1);

  const fetchData = async () => {
    const response = await api.fetchExpenses({
      page: page + 1,
      limit: perPage,
    });
    if (response) {
      setExpenses(response.data);
      setCount(response.meta.count);
    }
    setLoading(false);
  };

  useEffect(() => {
    fetchData();
  }, [page, perPage]);

  if (loading) {
    return (
      <Page>
        <Alert>Loading</Alert>
      </Page>
    );
  }

  return (
    <Page>
      <Pagination
        setPerPage={setPerPage}
        setPage={setPage}
        count={count}
        page={page}
        perPage={perPage}
      />
      <Expenses expenses={expenses} />
      <Pagination
        setPerPage={setPerPage}
        setPage={setPage}
        count={count}
        page={page}
        perPage={perPage}
      />
    </Page>
  );
}
