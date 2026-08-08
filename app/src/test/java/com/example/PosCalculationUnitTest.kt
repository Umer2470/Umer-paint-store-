package com.example

import org.junit.Assert.assertEquals
import org.junit.Test

class PosCalculationUnitTest {

    @Test
    fun testCartItemSubtotalCalculation() {
        val unitPrice = 150.0
        val quantity = 3
        val discount = 50.0
        val taxRatePercent = 5.0 // 5%

        val rawTotal = unitPrice * quantity
        val afterDiscount = rawTotal - discount
        val taxAmount = afterDiscount * (taxRatePercent / 100.0)
        val finalTotal = afterDiscount + taxAmount

        assertEquals(450.0, rawTotal, 0.001)
        assertEquals(400.0, afterDiscount, 0.001)
        assertEquals(20.0, taxAmount, 0.001)
        assertEquals(420.0, finalTotal, 0.001)
    }

    @Test
    fun testInventoryStockDeduction() {
        val initialStock = 25
        val soldQuantity = 5
        val remainingStock = initialStock - soldQuantity

        assertEquals(20, remainingStock)
    }
}
