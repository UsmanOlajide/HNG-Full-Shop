import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hype_kicks/data/home_repository.dart';
import 'package:hype_kicks/models/shoe.dart';
import 'package:hype_kicks/widgets/build_grid.dart';

class AllProductsScreen extends ConsumerStatefulWidget {
  const AllProductsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllProductsScreenState();
}

class _AllProductsScreenState extends ConsumerState<AllProductsScreen> {
  late Future<List<Shoe>> getShoes;

  @override
  void initState() {
    super.initState();
    getShoes = homeRepo.fetchShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Products',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: const Color.fromRGBO(41, 41, 41, 1), fontSize: 19.0),
        ),
      ),
      body: FutureBuilder(
        future: getShoes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                    child: BuildGrid(shoes: snapshot.data!)),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    size: 100.0,
                    color: Colors.red,
                  ),
                  Text('Failed to load all shoes'),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
