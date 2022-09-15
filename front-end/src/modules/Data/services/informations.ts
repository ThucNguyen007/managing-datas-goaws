import BaseService from "@core/class/BaseService";
import { Data } from "@core/interfaces";

class BookService extends BaseService {
  public create = (data: FormData): Promise<Data> => {
    return this.post("", data, {
      headers: { "Content-Type": "multipart/form-data" },
    });
  };
}

export default new BookService("/informations1", false);
