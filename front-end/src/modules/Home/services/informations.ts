import BaseService from "@core/class/BaseService";
import { Data } from "@core/interfaces";

class BookService extends BaseService {
  public list = (): Promise<Data[]> => {
    return this.get("");
  };
}

export default new BookService("/informations1", false);
