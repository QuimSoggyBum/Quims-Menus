// Quims Ender Chest Menu
if (${input$ENTITY} instanceof ServerPlayer player && ${input$ENTITY}.level() instanceof Level lvl) {
    final String qm_title = ${input$TEXT};

    player.openMenu(new MenuProvider() {

        @Override
        public Component getDisplayName() {
            return Component.literal(qm_title);
        }

        @Override
        public AbstractContainerMenu createMenu(int id, Inventory inv, Player playerEntity) {

            return ChestMenu.threeRows(
                id,
                inv,
                player.getEnderChestInventory()
            );
        }
    });
}
