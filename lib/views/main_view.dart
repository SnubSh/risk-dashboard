import 'package:flutter/material.dart';
import 'package:risk_dashboard/services/parser.dart';
import 'package:risk_dashboard/utils/funct_size.dart';
import 'package:risk_dashboard/views/dashboard_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, box) {
          return Stack(
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Menu(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _Header(size: size),
                      SizedBox(
                        height: Value.hp(1, size.height),
                      ),
                      Container(
                        margin: const EdgeInsets.all(7),
                        width: Value.wp(83, size.width),
                        height: box.maxHeight > 700 ? Value.hp(89, size.height) :Value.hp(86, size.height),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Value.dp(1, size)),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1),
                              color: Colors.black12,
                              blurRadius: 1,
                            )
                          ]
                        ),
                        child: LayoutBuilder(builder: (_, box){
                          return const DashboardView();
                        }),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Text('MIN H ${box.minHeight}, MIN W ${box.minWidth}, MAX H ${box.maxHeight}, MAX W ${box.maxWidth} ')
              ),
            ],
          );
        }
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Value.wp(85, size.width),
      height: Value.hp(8, size.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Value.dp(.3, size)),
        color: Colors.blue
      ),
      child: LayoutBuilder(
        builder: (_, box) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Value.wp(1, size.width), vertical: Value.hp(1, size.height)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: box.maxWidth > 1250 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                const Text('Avanza Solido SA de CV SOFOM ENR', style: TextStyle(color: Colors.white, fontSize: 15),),
                box.maxWidth > 1250 ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Sistema de Gestión y Reporte de Riesgos', style: TextStyle(color: Colors.white, fontSize: 14)),
                    Text(Parser.dateTimeToString(DateTime.now()).toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 13)),
                  ],
                ) : const SizedBox(),
              ],
            ),
          );
        }
      ),
    );
  }
}

class _Menu extends StatefulWidget {
  const _Menu();

  @override
  State<_Menu> createState() => _MenuState();
}

class _MenuState extends State<_Menu> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: Value.wp(15, size.width),
      height: Value.hp(100, size.height),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth > 200 ? Value.wp(15, size.width) : Value.wp(10, size.width),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                      ),
                      constraints.maxWidth > 200 ? const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text('USUARIO', style: TextStyle(color: Colors.white)),
                      ) : const SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight > 300 ? 200 : 500,
                  child: constraints.maxHeight < 250 ?Column(
                    children: [
                      _WidgetOption(icon: Icons.home_filled, title: 'inicio', tap: () {}, withBody: false, withFunction: true),
                      _WidgetOption(icon: Icons.stacked_bar_chart_rounded, title: 'Riesgo de Crédito', withFunction: false,
                        withBody: true,
                        body: [
                          _WidgetOptionBody(title: 'Actividad económica',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Concentración',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Producto',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Sucursal',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Antiguedad',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Calificación y reservas',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Cosechas de cartera',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Matriz de transición',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Riesgo de crédito',onSelect: () {
                            
                            }, 
                          ),
                        ],
                      ),
                      _WidgetOption(icon: Icons.stacked_bar_chart_rounded, title: 'Riesgo de Tasa y TC', tap: () {}, withBody: false, withFunction: true),
                      _WidgetOption(icon: Icons.stacked_bar_chart_rounded, title: 'Riesgo de Liquidez', tap: () {}, withBody: false, withFunction: true),
                      _WidgetOption(icon: Icons.table_chart_rounded, title: 'Matríz de Riesgos', tap: () {}, withBody: false, withFunction: true), 
                    ],
                  ) 
                  : ListView(
                    children: [
                      _WidgetOption(icon: Icons.home_filled, title: 'inicio', tap: () {}, withBody: false, withFunction: true),
                      _WidgetOption(icon: Icons.stacked_bar_chart_rounded, title: 'Riesgo de Crédito', withFunction: false,
                        withBody: true,
                        body: [
                          _WidgetOptionBody(title: 'Actividad económica',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Concentración',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Producto',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Sucursal',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Antiguedad',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Calificación y reservas',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Cosechas de cartera',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Matriz de transición',onSelect: () {
                            
                            }, 
                          ),
                          _WidgetOptionBody(title: 'Riesgo de crédito',onSelect: () {
                            
                            }, 
                          ),
                        ],
                      ),
                      _WidgetOption(icon: Icons.stacked_bar_chart_rounded, title: 'Riesgo de Tasa y TC', tap: () {}, withBody: false, withFunction: true),
                      _WidgetOption(icon: Icons.stacked_bar_chart_rounded, title: 'Riesgo de Liquidez', tap: () {}, withBody: false, withFunction: true),
                      _WidgetOption(icon: Icons.table_chart_rounded, title: 'Matríz de Riesgos', tap: () {}, withBody: false, withFunction: true), 
                    ],
                  ),
                ),
              ]
            ),
          );
        },
      ),
    );
  }
}

class _WidgetOptionBody extends StatefulWidget {
  const _WidgetOptionBody({
    required this.title, required this.onSelect
  });
  
  final String title;
  final void Function() onSelect;

  @override
  State<_WidgetOptionBody> createState() => _WidgetOptionBodyState();
}

class _WidgetOptionBodyState extends State<_WidgetOptionBody> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LayoutBuilder(
          builder: (_, box) {
            return box.maxWidth > 180
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 12)),
                const Icon(Icons.arrow_right_rounded, color: Colors.white),
              ],
            )
            : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 7), overflow: TextOverflow.ellipsis)),
              ],
            );
          }
        ),
      ),
    );
  }
}

class _WidgetOption extends StatefulWidget {
  const _WidgetOption({
    this.body, 
    this.tap, 
    required this.icon, 
    required this.title, 
    required this.withBody, 
    required this.withFunction, 
  });
  
  final IconData icon;
  final String title;
  final void Function()? tap;
  final List<Widget>? body;
  final bool withBody;
  final bool withFunction;

  @override
  State<_WidgetOption> createState() => _WidgetOptionState();
}

class _WidgetOptionState extends State<_WidgetOption> {
  bool _isExpanded = false;
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.withFunction ? widget.tap : (){
        setState(() {
        _onHover = true;
        _isExpanded = !_isExpanded;
        });
      },
      child: LayoutBuilder(
        builder: (_, box) {
          return MouseRegion(
            onEnter: (event) {
              setState(() {
                _onHover = true;
              });
            },
            onExit: (event) {
              setState(() {
                _onHover = false;
              });
            },
            cursor: MaterialStateMouseCursor.clickable,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _onHover ? Colors.blueAccent.shade400 : Colors.blue.shade400,
                borderRadius: BorderRadius.circular(10)
              ),
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  box.maxWidth > 210
                  ? Row(
                    children: [
                      Icon(widget.icon, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(widget.title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),),
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(widget.icon, color: Colors.white, size: 20,),
                    ],
                  ),
                  AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade300
                    ),
                    duration: const Duration(milliseconds: 300),
                    height: _isExpanded ? box.maxWidth > 210 ? 200 : 100 : 0, // Personaliza la altura del contenido
                    child: SingleChildScrollView(
                      child: widget.withBody
                        ? Column(
                          children: widget.body!,
                        ) 
                        : const SizedBox()
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
