// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Simple Blockchain Voting System
contract SimpleVoting {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
        bool exists;
    }

    // candidate storage
    mapping(uint256 => Candidate) public candidates;
    uint256 public candidateCount;

    // voting tracker
    mapping(address => bool) public hasVoted;
    uint256 public totalVotes;

    // events
    event CandidateAdded(uint256 indexed id, string name);
    event VoteCast(address indexed voter, uint256 indexed candidateId);

    /// @notice Add initial candidate at deployment
    /// @param initialName name of the first candidate
    constructor(string memory initialName) {
        _addCandidate(initialName);
    }

    /// @notice Internal helper to add a candidate
    function _addCandidate(string memory name) internal {
        uint256 id = candidateCount; // 0-based id
        candidates[id] = Candidate({
            id: id,
            name: name,
            voteCount: 0,
            exists: true
        });
        candidateCount += 1;
        emit CandidateAdded(id, name);
    }

    /// @notice Add a new candidate
    /// @param name candidate name
    function addCandidate(string calldata name) external {
        _addCandidate(name);
    }

    /// @notice Cast vote for a candidate
    /// @param candidateId id of candidate to vote for
    function vote(uint256 candidateId) external {
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateId < candidateCount && candidates[candidateId].exists, "Invalid candidate");

        // record vote
        candidates[candidateId].voteCount += 1;
        hasVoted[msg.sender] = true;
        totalVotes += 1;

        emit VoteCast(msg.sender, candidateId);
    }

    /// @notice Get votes for a candidate
    /// @param candidateId id of candidate
    /// @return voteCount number of votes
    function getVotes(uint256 candidateId) external view returns (uint256 voteCount) {
        require(candidateId < candidateCount && candidates[candidateId].exists, "Invalid candidate");
        return candidates[candidateId].voteCount;
    }

    /// @notice Get total votes cast
    /// @return total number of votes
    function getTotalVotes() external view returns (uint256) {
        return totalVotes;
    }

    /// @notice Get total number of candidates
    /// @return total candidates
    function getTotalCandidates() external view returns (uint256) {
        return candidateCount;
    }

    /// @notice Get candidate information by ID
    /// @param candidateId The ID of the candidate
    /// @return id The ID of the candidate
    /// @return name The name of the candidate
    /// @return voteCount The vote count of the candidate
    function getCandidate(uint256 candidateId) external view returns (uint256 id, string memory name, uint256 voteCount) {
        require(candidateId < candidateCount && candidates[candidateId].exists, "Invalid candidate");
        Candidate storage c = candidates[candidateId];
        return (c.id, c.name, c.voteCount);
    }
}
