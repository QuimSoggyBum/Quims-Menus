// Quims Menu - Return Random Item
/*@Item*/(
new java.util.function.Supplier<Item>() {
    @Override
    public Item get() {

        java.util.List<Item> quims_random_items =
            new java.util.ArrayList<>();

        java.util.List<Item> quims_excluded_items =
            new java.util.ArrayList<>();

		String excludedItems = ${input$EXCLUDED_ITEMS};

		if (excludedItems != null && !excludedItems.trim().isEmpty()) {

			for (String itemPattern : excludedItems.split(",")) {

				itemPattern = itemPattern.trim();

				if (itemPattern.isEmpty())
					continue;

				if (itemPattern.contains("*")) {

					String regex = itemPattern
						.replace(".", "\\.")
						.replace("*", ".*");

					for (Item possibleItem : BuiltInRegistries.ITEM) {

						if (possibleItem == Items.AIR)
							continue;

						var id =
							BuiltInRegistries.ITEM.getKey(possibleItem);

						if (id != null &&
							id.toString().matches("(?i)" + regex)) {

							quims_excluded_items.add(possibleItem);

						}
					}

				} else {
					try {

						var location = Identifier.parse(itemPattern);

						Item excluded =
							BuiltInRegistries.ITEM.get(location)
								.map(ref -> ref.value())
								.orElse(null);

						if (excluded != null &&
							excluded != Items.AIR) {

							quims_excluded_items.add(excluded);
						}

					} catch (Exception ignored) {

					}
				}

			}

		}

		boolean excludeAdminItems = ${input$EXCLUDE_ADMIN_ITEMS!true};

        for (Item quims_item : BuiltInRegistries.ITEM) {

            if (quims_item == Items.AIR)
                continue;
			
            if (excludeAdminItems &&
				(quims_item == Items.COMMAND_BLOCK ||
				 quims_item == Items.CHAIN_COMMAND_BLOCK ||
				 quims_item == Items.REPEATING_COMMAND_BLOCK ||
				 quims_item == Items.STRUCTURE_BLOCK ||
				 quims_item == Items.JIGSAW ||
				 quims_item == Items.BARRIER ||
				 quims_item == Items.DEBUG_STICK))
				continue;

            if (quims_excluded_items.contains(quims_item))
                continue;

            quims_random_items.add(quims_item);

        }

        if (!quims_random_items.isEmpty()) {

            return quims_random_items.get(
                new java.util.Random().nextInt(
                    quims_random_items.size()
                )
            );

        }

        return Items.AIR;

    }
}.get()
)
