<?php

namespace App\Http\Controllers;

use App\Catalog\Application\Products\PublishProductCommand;
use App\Catalog\Application\Products\PublishProductService;
use App\Catalog\Domain\Products\ProductCannotBePublished;
use App\Models\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class ProductPublicationController extends Controller
{
    public function __invoke(Request $request, Product $product, PublishProductService $publishProduct): JsonResponse
    {
        Gate::authorize('update', $product);

        try {
            $publishProduct->handle(new PublishProductCommand(
                productId: $product->id,
                actorId: $request->user()->id,
            ));
        } catch (ProductCannotBePublished $exception) {
            return response()->json([
                'message' => $exception->getMessage(),
                'code' => 'product_cannot_be_published',
            ], 422);
        }

        return response()->json([
            'message' => 'Product published.',
            'status' => 'published',
        ]);
    }
}
