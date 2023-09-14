from pydantic import BaseModel, Field

from faststream import FastStream, Logger
from faststream.kafka import KafkaBroker


class MultiplyMessage(BaseModel):
    a: int = Field(..., examples=[2], description="Integer value")
    b: int = Field(..., examples=[3], description="Integer value")


class Results(BaseModel):
    res: int = Field(..., examples=[6], description="Result of multiplication")


broker = KafkaBroker("localhost:9092")
app = FastStream(broker)


@broker.subscriber("multiply")
@broker.publisher("results")
async def multiply_numbers(msg: MultiplyMessage, logger: Logger) -> Results:
    logger.info(msg)

    result = msg.a * msg.b
    result_obj = Results(res=result)
    return result_obj
