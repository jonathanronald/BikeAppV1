<?php 
namespace App\Http\Controllers;
use App\Trip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
class TripController extends Controller{

	public function index(){
		$trips = Trip::all();
		return response()->json(['data' => $trips], 200);
	}

	//store data Trip
	public function store(Request $request){
		$this->validateRequest($request);
		$trips = Trip::create([
			
		'user_id' => $request->get('user_id'),
		'start_longitude' => $request->get('start_longitude'),
		'start_latitude' => $request->get('start_latitude'),
		'end_latitude' => $request->get('end_latitude'),
		'end_longitude' => $request->get('end_longitude'),
		'start_time' => $request->get('start_time'),
		'finish_time' => $request->get('finish_time'),
		'total_distance' => $request->get('total_distance'),
		'top_speed' => $request->get('top_speed'),
		'average_cadence' => $request->get('average_cadence'),
		'top_cadence' => $request->get('top_cadence')
		]);
		return response()->json(['data' => "The trip with with id {$trip->id} has been created"], 201);
	}

	public function show($id){
		//trip profile & achievement
		$trip = Trip::find($id);
		
		//error message
		if(!$trip){
			return response()->json(['message' => "The trip with {$id} doesn't exist"], 404);
		}
		//return trip
		return response()->json(['data' => $trip], 200);
	}

	//edit data trip
	public function update(Request $request, $id){
		$trip = trip::find($id);
		if(!$trip){
			return response()->json(['message' => "The trip with {$id} doesn't exist"], 404);
		}
		$this->validateRequest($request);
		$trip->user_id = $request->get('user_id');
		$trip->start_latitude = $request->get('start_latitude');
		$trip->start_longitude = $request->get('start_longitude');
		$trip->end_latitude = $request->get('end_latitude');
		$trip->end_longitude = $request->get('end_longitude');
		$trip->start_time = $request->get('start_time');
		$trip->finish_time = $request->get('finish_time');
		$trip->total_distance = $request->get('total_distance');
		$trip->top_speed = $request->get('top_speed');
		$trip->average_cadence = $request->get('average_cadence');
		$trip->top_cadence = $request->get('top_cadence');

		$trip->save();
		return response()->json(['data' => "The trip with with id {$trip->id} has been updated"], 200);
	}

	//delete data trip
	public function destroy($id){
		$trip = trip::find($id);
		if(!$trip){
			return response()->json(['message' => "The trip with {$id} doesn't exist"], 404);
		}
		$trip->delete();
		return response()->json(['data' => "The trip with with id {$id} has been deleted"], 200);
	}

	public function validateRequest(Request $request){
		$rules = [
		'user_id' => 'required|user_id|unique:trips',
		'start_longitude' => 'required',
		'start_latitude' => 'required',
		'end_longitude' => 'required',
		'end_latitude' => 'required',
		'start_time' => 'required',
		'finish_time' => 'required',
		'total_distance' => 'required',
		'top_speed' => 'required',
		'average_cadence' => 'required',
		'top_cadence' => 'required'

		];
		$this->validate($request, $rules);
	}
}