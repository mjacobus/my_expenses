import React, { useState, useEffect } from "react";
import Alert from "@mui/material/Alert";
import api from "../../utils/api";
import DataGrid from "../../components/DataGrid";
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

  const fetchData = async () => {
    const response = await api.fetchExpenses();
    if (response) {
      setExpenses(response.data);
    }
    setLoading(false);
  };

  useEffect(() => {
    fetchData();
  }, []);

  if (loading) {
    return (
      <Page>
        <Alert>Loading</Alert>
      </Page>
    );
  }

  return (
    <Page>
      <Expenses expenses={expenses} />
    </Page>
  );
}
