<?php

namespace App\Catalog\Application\Support;

interface TransactionManager
{
    /**
     * @template T
     *
     * @param callable(): T $callback
     *
     * @return T
     */
    public function run(callable $callback): mixed;
}
