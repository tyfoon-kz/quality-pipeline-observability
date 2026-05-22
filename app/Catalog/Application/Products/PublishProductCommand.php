<?php

namespace App\Catalog\Application\Products;

final readonly class PublishProductCommand
{
    public function __construct(
        public int $productId,
        public int $actorId,
    ) {
    }
}
