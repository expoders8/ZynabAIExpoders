import 'package:flutter/material.dart';

class CustomSearchScreen extends StatefulWidget {
  final List<String> medicines;

  const CustomSearchScreen({super.key, required this.medicines});

  @override
  State<CustomSearchScreen> createState() => _CustomSearchScreenState();
}

class _CustomSearchScreenState extends State<CustomSearchScreen> {
  List<String> _filteredMedicines = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredMedicines = widget.medicines; // Initialize with all medicines
  }

  void _searchMedicine(String query) {
    setState(() {
      _filteredMedicines = widget.medicines
          .where((med) => med.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Medicine")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// **Search Bar**
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search medicine...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _searchMedicine,
            ),
            const SizedBox(height: 16),

            /// **Medicine List**
            Expanded(
              child: ListView.builder(
                itemCount: _filteredMedicines.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(_filteredMedicines[index]),
                  onTap: () {
                    Navigator.pop(
                        context,
                        _filteredMedicines[
                            index]); // Pop with selected medicine
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
