import 'package:example/cubit/bloc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePageYest extends StatefulWidget {
  const HomePageYest({Key? key}) : super(key: key);

  @override
  State<HomePageYest> createState() => _HomePageYestState();
}

class _HomePageYestState extends State<HomePageYest> {
  @override
  final TextEditingController _controller = TextEditingController();

  int s1 = 0;
  int s2 = 0;

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HisoblaBloc(),
      child: BlocConsumer<HisoblaBloc, HisoblaState>(
        listener: (context, state) {},
        builder: (context, state) {
          return myScaffold(context);
        },
      ),
    );
  }

  Scaffold myScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          context.watch<HisoblaBloc>().appText,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context) .size.height * 0.03
          ),
        ),
        backgroundColor: context.watch<HisoblaBloc>().appBarColor,
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              context.read<HisoblaBloc>().addRandom();
              context.read<HisoblaBloc>().addColor();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.89,
            child: GridView.custom(
              gridDelegate: SliverStairedGridDelegate(
                  crossAxisSpacing: 48,
                  mainAxisSpacing: 24,
                  startCrossAxisDirectionReversed: true,
                  pattern: [
                    const StairedGridTile(0.5, 0.7),
                    const StairedGridTile(0.5, 3 / 3),
                    const StairedGridTile(1.0, 10 / 3),
                  ]),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: context.watch<HisoblaBloc>().contColor[index],
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          context.watch<HisoblaBloc>().random[index].toString(),
                          style: TextStyle(
                            color:
                                context.watch<HisoblaBloc>().textColor[index],
                            fontSize: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                      ),
                    ),
                    onTap: context.watch<HisoblaBloc>().ontap == true
                        ? null
                        : () {
                            context.read<HisoblaBloc>().addSort(index);
                          },
                  );
                },
                childCount: context.watch<HisoblaBloc>().random.length,
              ),
            ),
          ),
          Positioned(
            child: Visibility(
              visible: context.watch<HisoblaBloc>().start,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: Text(
                  'Start',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.05
                  ),
                ),
                onPressed: () {
                  context.read<HisoblaBloc>().addRandom();

                  context.read<HisoblaBloc>().addColor();
                },
              ),
            ),
          ),
        ],
        alignment: AlignmentDirectional.center,
      ),
    );
  }
}
