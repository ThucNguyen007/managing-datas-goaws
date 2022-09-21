import { ModuleConfig } from "@core/interfaces";

const config: ModuleConfig = {
  name: "Data",
  baseUrl: "/informations1",
  routes: [
    {
      path: "create",
      page: "Create",
      title: "Create a new information",
      exact: true,
    },
  ],
  requireAuthenticated: "any",
};

export default config;
