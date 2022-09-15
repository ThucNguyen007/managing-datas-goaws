import { ModuleConfig } from "@core/interfaces";

const config: ModuleConfig = {
  name: "Book",
  baseUrl: "/informations1",
  routes: [
    {
      path: "create",
      page: "Create",
      title: "Create a new book",
      exact: true,
    },
  ],
  requireAuthenticated: "any",
};

export default config;
