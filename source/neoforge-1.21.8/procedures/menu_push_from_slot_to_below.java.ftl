// Quims Push Items Direction

LevelAccessor push_lvl = world;

BlockPos push_qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});

Direction push_dir = Direction.${field$DIRECTION};

BlockPos push_targetPos = push_qmp_Pos.relative(push_dir);

Container push_sourceContainer = null;
Container push_targetContainer = null;

if (push_lvl instanceof Level level) {
    push_sourceContainer = HopperBlockEntity.getContainerAt(level, push_qmp_Pos);
    push_targetContainer = HopperBlockEntity.getContainerAt(level, push_targetPos);
}

boolean push_movedItem = false;

if (push_sourceContainer != null && push_targetContainer != null) {

    for (int slot = 0; slot < push_sourceContainer.getContainerSize(); slot++) {

        if (push_movedItem)
            break;

        ItemStack stack = push_sourceContainer.getItem(slot);

        if (!stack.isEmpty()) {

            ItemStack moving = stack.copy();
            moving.setCount(1);

            for (int targetSlot = 0; targetSlot < push_targetContainer.getContainerSize(); targetSlot++) {

                if (push_targetContainer.canPlaceItem(targetSlot, moving)) {

                    ItemStack targetStack = push_targetContainer.getItem(targetSlot);

                    if (targetStack.isEmpty()) {

                        push_targetContainer.setItem(targetSlot, moving);

                        stack.shrink(1);
                        push_sourceContainer.setItem(slot, stack);

                        push_sourceContainer.setChanged();
                        push_targetContainer.setChanged();

                        push_movedItem = true;
                        break;
                    }

                    if (ItemStack.isSameItemSameComponents(targetStack, moving)
                            && targetStack.getCount() < targetStack.getMaxStackSize()) {

                        targetStack.grow(1);

                        stack.shrink(1);
                        push_sourceContainer.setItem(slot, stack);

                        push_sourceContainer.setChanged();
                        push_targetContainer.setChanged();

                        push_movedItem = true;
                        break;
                    }
                }
            }
        }
    }
}

// Quims Push Items Direction







/*
LevelAccessor push_lvl = world;

BlockPos push_qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});

Direction push_dir = Direction.${field$DIRECTION};

BlockPos push_targetPos = push_qmp_Pos.relative(push_dir);

boolean push_movedItem = false;

if (push_lvl.getBlockEntity(push_qmp_Pos) instanceof Container sourceContainer &&
    push_lvl.getBlockEntity(push_targetPos) instanceof Container targetContainer) {

    for (int slot = 0; slot < sourceContainer.getContainerSize(); slot++) {

        if (push_movedItem) {
            break;
        }

        ItemStack stack = sourceContainer.getItem(slot);

        if (!stack.isEmpty()) {

            ItemStack moving = stack.copy();
            moving.setCount(1);

            for (int targetSlot = 0; targetSlot < targetContainer.getContainerSize(); targetSlot++) {

                if (!targetContainer.canPlaceItem(targetSlot, moving)) {
                    continue;
                }

                ItemStack targetStack = targetContainer.getItem(targetSlot);

                if (targetStack.isEmpty()) {

                    targetContainer.setItem(targetSlot, moving);

                    stack.shrink(1);
                    sourceContainer.setItem(slot, stack);

                    sourceContainer.setChanged();
                    targetContainer.setChanged();

                    push_movedItem = true;
                    break;
                }

                if (ItemStack.isSameItemSameComponents(targetStack, moving)
                        && targetStack.getCount() < targetStack.getMaxStackSize()) {

                    targetStack.grow(1);

                    stack.shrink(1);
                    sourceContainer.setItem(slot, stack);

                    sourceContainer.setChanged();
                    targetContainer.setChanged();

                    push_movedItem = true;
                    break;
                }
            }
        }
    }
}
*/
