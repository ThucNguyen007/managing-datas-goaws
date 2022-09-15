import { UploadFile } from "antd/lib/upload/interface";

export interface Data {
  id: string;
  name: string;
  author: string;
  image: string;
}

export interface DataCreate {
  id: string;
  name: string;
  author: string;
  upload: UploadFile[];
}
