<?php

namespace App\Catalog\Domain\Products;

interface ProductRepository
{
    public function findForPublication(int $productId): ProductForPublication;

    public function requiredAttributesForProduct(int $productId): RequiredAttributes;

    public function savePublished(ProductForPublication $product, int $actorId): void;
}
