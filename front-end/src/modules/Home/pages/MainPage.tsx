import { Avatar, Card, Col, Row } from "antd";
import { useEffect, useState } from "react";

import { Data } from "@core/interfaces";
import bookApi from "@modules/Home/services/informations";

const { Meta } = Card;

interface Props {}

const MainPage = (props: Props) => {
  /* State */
  const [datas, setDatas] = useState<Data[]>([]);

  useEffect(() => {
    bookApi.list().then((res) => {
      setDatas(res);
    });
  }, []);

  return (
    <div className="container home">
      <Row className="datas" gutter={16}>
        {datas.map((data) => (
          <Col key={data.id} lg={6}>
            <Card
              hoverable
              style={{ width: "100%" }}
              cover={
                <Avatar
                  shape="square"
                  alt={data.name}
                  src={data.image}
                />
              }
            >
              <Meta
                title={data.name}
                description={data.author}
              />
            </Card>
          </Col>
        ))}
      </Row>
    </div>
  );
};

export default MainPage;
