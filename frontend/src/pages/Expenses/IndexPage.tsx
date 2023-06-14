import React, { useState, useEffect } from "react";
import Alert from "@mui/material/Alert";
import api from "../../utils/api";
import { create } from "../../utils/localStorage";
import DataGrid from "../../components/DataGrid";
import Pagination from "../../components/TablePagination";
import Expense from "../../types/Expense";

import { useSearchParams } from "react-router-dom";

const storage = create("expenses-preferences");

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

function newSearchParams(searchParams: URLSearchParams, newValues = {}) {
  const values = Object.fromEntries(searchParams);
  Object.assign(values, newValues);
  return values;
}

export default function IndexPage() {
  const [searchParams, setSearchParams] = useSearchParams();
  const queryParams = newSearchParams(searchParams);
  const [expenses, setExpenses] = useState<Expense[]>([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(() => {
    if (queryParams.page) {
      return parseInt(queryParams.page) - 1;
    }

    return 0; // it starts at 0
  });
  const [perPage, setPerPage] = useState<number>(() => {
    if (queryParams.perPage) {
      return parseInt(queryParams.perPage);
    }

    return storage.getInt("perPage", 100) || 100;
  });
  const [count, setCount] = useState(1);

  const fetchData = async () => {
    const response = await api.fetchExpenses({
      page: page + 1,
      limit: perPage,
    });
    storage.set("perPage", (perPage || "").toString());
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

  const setPageWrapper = (page: number) => {
    setPage(page);
    setSearchParams(newSearchParams(searchParams, { page: page + 1 }));
  };

  const setPerPageWrapper = (perPage: number) => {
    setPerPage(perPage);
    setSearchParams(newSearchParams(searchParams, { perPage }));
  };

  return (
    <Page>
      <Pagination
        setPerPage={setPerPageWrapper}
        setPage={setPageWrapper}
        count={count}
        page={page}
        perPage={perPage || 10}
      />
      <Expenses expenses={expenses} />
      <Pagination
        setPerPage={setPerPageWrapper}
        setPage={setPageWrapper}
        count={count}
        page={page}
        perPage={perPage || 10}
      />
    </Page>
  );
}
