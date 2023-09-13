import pytest
from faststream.kafka import TestKafkaBroker

from app.application import MultiplyMessage, Results, broker, multiply_numbers


@pytest.mark.asyncio
async def test_multiply_numbers():
    async with TestKafkaBroker(broker):
        @broker.subscriber("results")
        async def on_result(msg: Results):
            assert msg.res == 6

        await broker.publish(MultiplyMessage(a=2, b=3), "multiply")
