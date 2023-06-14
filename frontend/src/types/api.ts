import Expense from "./Expense";

interface Meta {
  count: number;
  page: number;
  limit: number;
}

export interface ExpensesResponse {
  data: Expense[];
  meta: Meta;
}
