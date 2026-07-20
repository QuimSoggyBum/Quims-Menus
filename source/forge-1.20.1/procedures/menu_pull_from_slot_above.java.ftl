// Quims Pull Items From Direction

LevelAccessor pull_lvl = world;

BlockPos pull_qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});

Direction pull_dir = Direction.${field$DIRECTION};

BlockPos pull_sourcePos = pull_qmp_Pos.relative(pull_dir);

Container pull_sourceContainer = null;
Container pull_targetContainer = null;

if (pull_lvl instanceof Level level) {
    pull_sourceContainer = HopperBlockEntity.getContainerAt(level, pull_sourcePos);
    pull_targetContainer = HopperBlockEntity.getContainerAt(level, pull_qmp_Pos);
}

boolean pull_movedItem = false;

if (pull_sourceContainer != null && pull_targetContainer != null) {

    for (int slot = 0; slot < pull_sourceContainer.getContainerSize(); slot++) {

        if (pull_movedItem)
            break;

        ItemStack stack = pull_sourceContainer.getItem(slot);

        if (!stack.isEmpty()) {

            ItemStack moving = stack.copy();
            moving.setCount(1);

            for (int targetSlot = 0; targetSlot < pull_targetContainer.getContainerSize(); targetSlot++) {

                if (!pull_targetContainer.canPlaceItem(targetSlot, moving))
                    continue;

                ItemStack targetStack = pull_targetContainer.getItem(targetSlot);

                if (targetStack.isEmpty()) {

                    pull_targetContainer.setItem(targetSlot, moving);

                    stack.shrink(1);
                    pull_sourceContainer.setItem(slot, stack);

                    pull_sourceContainer.setChanged();
                    pull_targetContainer.setChanged();

                    pull_movedItem = true;
                    break;
                }

                if (ItemStack.isSameItemSameTags(targetStack, moving)
                        && targetStack.getCount() < targetStack.getMaxStackSize()) {

                    targetStack.grow(1);

                    stack.shrink(1);
                    pull_sourceContainer.setItem(slot, stack);

                    pull_sourceContainer.setChanged();
                    pull_targetContainer.setChanged();

                    pull_movedItem = true;
                    break;
                }
            }
        }
    }
}
