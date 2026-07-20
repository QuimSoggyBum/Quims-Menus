// Quims Void Items

LevelAccessor void_lvl = world;

BlockPos void_qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});

Container voidContainer = null;

if (void_lvl instanceof Level level) {

    // Handles vanilla chests, double chests, large inventories
    voidContainer = HopperBlockEntity.getContainerAt(level, void_qmp_Pos);

    // Handles custom block entities
    if (voidContainer == null &&
        level.getBlockEntity(void_qmp_Pos) instanceof Container container) {

        voidContainer = container;
    }
}

if (voidContainer != null) {

    if ("INVENTORY".equals("${field$AMOUNT}")) {

        for (int slot = 0; slot < voidContainer.getContainerSize(); slot++) {

            voidContainer.setItem(slot, ItemStack.EMPTY);

        }

        voidContainer.setChanged();

    } else {

        for (int slot = 0; slot < voidContainer.getContainerSize(); slot++) {

            ItemStack stack = voidContainer.getItem(slot);

            if (!stack.isEmpty()) {

                if ("SINGLE".equals("${field$AMOUNT}")) {

                    stack.shrink(1);

                    voidContainer.setItem(slot, stack);

                    voidContainer.setChanged();

                    break;
                }

                if ("SLOT".equals("${field$AMOUNT}")) {

                    voidContainer.setItem(slot, ItemStack.EMPTY);

                    voidContainer.setChanged();

                    break;
                }
            }
        }
    }
}
